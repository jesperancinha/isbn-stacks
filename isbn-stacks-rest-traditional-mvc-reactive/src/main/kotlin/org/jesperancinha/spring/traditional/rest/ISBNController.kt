package org.jesperancinha.spring.traditional.rest

import com.fasterxml.jackson.databind.JsonNode
import com.fasterxml.jackson.databind.ObjectMapper
import org.jesperancinha.spring.IsbnDto
import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Flux
import reactor.core.publisher.Mono


@RestController
@RequestMapping("/api/traditional")
class ISBNController {
    var mapper = ObjectMapper()

    @GetMapping("hello")
    fun getMessage(): Mono<String> {
        return Mono.just(MESSAGE)
    }


    @GetMapping
    fun getJsonMessage(): Mono<JsonNode> {
        return Mono.fromCallable {
            val createObjectNode = mapper.createObjectNode()
            createObjectNode.put("message", MESSAGE)
            createObjectNode
        }
    }

    @GetMapping("isbns")
    fun getIsbns(): Flux<IsbnDto> {
        return Flux.fromIterable(ISBNS)
    }

    companion object {
        const val MESSAGE = "I will now give you 1.000.000 ISBN numbers in a Spring MVC Reactive way"
    }
}