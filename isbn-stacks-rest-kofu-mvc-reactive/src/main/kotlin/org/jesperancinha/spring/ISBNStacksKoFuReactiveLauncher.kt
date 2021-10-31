package org.jesperancinha.spring

import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.springframework.fu.kofu.reactiveWebApplication
import org.springframework.fu.kofu.webflux.webFlux
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse

val app = reactiveWebApplication {
    beans {
        bean<ISBNSampleService>()
        bean<ISBNSampleHandler>()
    }
    webFlux {
        port = if (profiles.contains("test")) 8181 else 8080
        router {
            val handler = ref<ISBNSampleHandler>()
            GET("/api/kofu/hello", handler::hello)
            GET("/api/kofu", handler::json)
            GET("/api/kofu/isbns", handler::isbns)
        }
        codecs {
            string()
            jackson()
        }
    }
}

data class ISBNMessage(val message: String)

class ISBNSampleService {
    fun generateMessage() = "I will now give you 1.000.000 ISBN numbers in a Spring KoFu Reactive way"
}

class ISBNSampleHandler(private val isbnSampleService: ISBNSampleService) {
    fun hello(request: ServerRequest) = ServerResponse.ok().bodyValue(isbnSampleService.generateMessage())
    fun json(request: ServerRequest) = ServerResponse.ok().bodyValue(ISBNMessage(isbnSampleService.generateMessage()))
    fun isbns(request: ServerRequest) = ServerResponse.ok().bodyValue(ISBNS)
}

class ISBNStacksKoFuReactiveLauncher{
    companion object{
        @JvmStatic
        fun main(args: Array<String>) {
            app.run()
        }
    }
}


