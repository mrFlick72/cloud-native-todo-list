package it.valeriovaudi.todolistwebsite

import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.core.ParameterizedTypeReference
import org.springframework.http.HttpMethod
import org.springframework.http.RequestEntity
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.web.client.RestTemplate
import org.springframework.web.servlet.function.ServerResponse
import org.springframework.web.servlet.function.router
import java.util.*


@SpringBootApplication
class TodoListWebSiteApplication {

    @Bean
    fun todoRoutes(@Value("\${todo.base-url}") baseUrl : String) = router {
        val restTemplate = RestTemplate()
        GET("/todo") {
            it.principal()
                    .map { it.name }
                    .map {
                        restTemplate.exchange(
                                "${baseUrl}/todo?username=$it",
                                HttpMethod.GET,
                                RequestEntity.EMPTY,
                                typeRef<List<TodoRepresentation>>()
                        ).body
                    }
                    .map { ok().body(it!!) }
                    .orElseGet { noContent().build() }

        }
        POST("/todo") {
            val body = it.body(TodoRepresentation::class.java)
            it.principal()
                    .map { it.name }
                    .map {
                        body.userName = it
                        restTemplate.postForEntity(
                                "${baseUrl}/todo",
                                body,
                                String::class.java
                        )
                    }
                    .map { ServerResponse.status(it.statusCode).build() }
                    .orElseGet { ServerResponse.unprocessableEntity().build() }

        }
        DELETE("/todo/{id}") {
            val id = it.pathVariable("id")
            restTemplate.delete("${baseUrl}/todo/$id")
            ServerResponse.noContent().build()
        }
    }
}

data class TodoRepresentation(var id: String = UUID.randomUUID().toString(),
                              var date: String,
                              var userName: String?,
                              var content: String)

inline fun <reified T : Any> typeRef(): ParameterizedTypeReference<T> = object : ParameterizedTypeReference<T>() {}

fun main(args: Array<String>) {
    runApplication<TodoListWebSiteApplication>(*args)
}


@EnableWebSecurity
class OAuth2SecurityConfig : WebSecurityConfigurerAdapter() {

    override fun configure(http: HttpSecurity) {
        http.csrf().disable()
                .authorizeRequests().mvcMatchers("/actuator/**").permitAll()
                .and()
                .authorizeRequests().anyRequest().authenticated()
                .and().oauth2Login().defaultSuccessUrl("/index.html")
    }

}