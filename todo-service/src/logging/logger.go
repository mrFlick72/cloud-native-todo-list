package logging

import (
	"fmt"
	"go.uber.org/zap"
	"os"
)

var (
	fileName  = os.Getenv("LOGGING_FILE_NAME")
	logger, _ = loggerConfigurer().Build()
)

func loggerConfigurer() zap.Config {
	cfg := zap.NewProductionConfig()

	fmt.Println("log file name: ", fileName)
	if len(fileName) > 0 {
		_, err := os.Create(fileName)
		if err != nil {
			panic("log file des not exist")
		}

		cfg.OutputPaths = []string{fileName}
	}
	return cfg
}

func Logger() *zap.Logger {
	return logger
}

func LogErrorFor(error error) {
	logger.Error(error.Error())
}

func Dispose() {
	panic("TODO it have to be implemented")
}
