package org.jesperancinha.spring.traditional.rest

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.node.ObjectNode
import org.jesperancinha.spring.IsbnDto
import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/api/traditional/non")
class ISBNController {
    var mapper = ObjectMapper()

    @GetMapping("hello")
    fun getMessage(): String {
        return MESSAGE
    }


    @GetMapping
    fun getJsonMessage(): ObjectNode? {
        val createObjectNode = mapper.createObjectNode()
        createObjectNode.put("message", MESSAGE)
        return createObjectNode
    }

    @GetMapping("isbns")
    fun getIsbns(): List<IsbnDto> {
        return ISBNS
    }

    companion object {
        const val MESSAGE = "I will now give you 1.000.000 ISBN numbers in a Spring MVC Non-Reactive way"
    }
}