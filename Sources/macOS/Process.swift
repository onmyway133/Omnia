//
//  Process.swift
//  Omnia
//
//  Created by khoa on 21/03/2021.
//

import Foundation

#if canImport(AppKit)
public extension Process {
    @discardableResult
    func launchBash(
        with command: String,
        onOutput: ((Data) -> Void)? = nil,
        onError: ((Data) -> Void)? = nil
    ) -> String {
        launchPath = "/bin/bash"
        arguments = ["-c", command]

        let outputQueue = DispatchQueue(label: "Process.OutputQueue")

        var outputData = Data()
        var errorData = Data()

        let outputPipe = Pipe()
        standardOutput = outputPipe

        let errorPipe = Pipe()
        standardError = errorPipe

        outputPipe.fileHandleForReading.readabilityHandler = { handler in
            outputQueue.async {
                let data = handler.availableData
                outputData.append(data)
                onOutput?(data)
            }
        }

        errorPipe.fileHandleForReading.readabilityHandler = { handler in
            outputQueue.async {
                let data = handler.availableData
                errorData.append(data)
                onError?(data)
            }
        }

        launch()
        waitUntilExit()

        outputPipe.fileHandleForReading.readabilityHandler = nil
        errorPipe.fileHandleForReading.readabilityHandler = nil

        return outputQueue.sync {
            if terminationStatus != 0 {
                let errorString = String(data: errorData, encoding: .utf8) ?? ""
                if !errorString.isEmpty {
                    print("Process error \(errorString)")
                }
            }

            return outputData.shellOutput()
        }
    }
}

private extension Data {
    func shellOutput() -> String {
        guard let output = String(data: self, encoding: .utf8) else {
            return ""
        }

        guard !output.hasSuffix("\n") else {
            let endIndex = output.index(before: output.endIndex)
            return String(output[..<endIndex])
        }

        return output
    }
}
#endif
