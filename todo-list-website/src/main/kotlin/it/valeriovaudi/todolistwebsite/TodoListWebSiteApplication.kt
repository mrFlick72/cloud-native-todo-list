package it.valeriovaudi.todolistwebsite

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.boot.web.client.RestTemplateBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter
import org.springframework.web.client.RestTemplate
import java.util.Map


@SpringBootApplication
class TodoListWebSiteApplication {

}

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