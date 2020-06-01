package logging

import (
	"go.uber.org/zap"
)

var (
	logger, _ = zap.NewProduction()
)

func Logger() *zap.Logger {
	return logger
}

func LogErrorFor(error error) {
	logger.Error(error.Error())
}
