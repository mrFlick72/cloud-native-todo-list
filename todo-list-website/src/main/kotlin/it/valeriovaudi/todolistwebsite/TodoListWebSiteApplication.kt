package it.valeriovaudi.todolistwebsite

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication


@SpringBootApplication
class TodoListWebSiteApplication {

}

fun main(args: Array<String>) {
    runApplication<TodoListWebSiteApplication>(*args)
}