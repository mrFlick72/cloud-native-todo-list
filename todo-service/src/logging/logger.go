package logging

import (
	"go.uber.org/zap"
	"os"
)

var (
	logger, _ = loggerConfigurer().Build()
)

func loggerConfigurer() zap.Config {
	cfg := zap.NewProductionConfig()
	cfg.OutputPaths = []string{os.Getenv("LOGGING_FILE_NAME")}

	file, _ := os.Create(os.Getenv("LOGGING_FILE_NAME"))
	defer file.Close()

	return cfg
}

func Logger() *zap.Logger {
	return logger
}

func LogErrorFor(error error) {
	logger.Error(error.Error())
}
