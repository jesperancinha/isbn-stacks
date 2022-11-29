package org.jesperancinha.spring

import org.jesperancinha.spring.IsbnDto.Companion.ISBNS
import org.jesperancinha.spring.IsbnDto.Companion.SMALL_ISBNS
import org.springframework.boot.web.reactive.context.ReactiveWebServerApplicationContext
import org.springframework.context.aot.AotApplicationContextInitializer
import org.springframework.fu.kofu.reactiveWebApplication
import org.springframework.fu.kofu.webflux.webFlux
import org.springframework.http.server.reactive.HttpHandler
import org.springframework.http.server.reactive.ServerHttpRequest
import org.springframework.http.server.reactive.ServerHttpResponse
import org.springframework.web.reactive.function.server.ServerRequest
import org.springframework.web.reactive.function.server.ServerResponse
import reactor.core.publisher.Mono

val app = reactiveWebApplication {
    beans {
        bean<ISBNSampleService>(isPrimary = true)
        bean<ISBNSampleHandler>(isPrimary = true)
    }
    webFlux {
        port = if (profiles.contains("test")) 8181 else 8080
        router {
            val handler = ref<ISBNSampleHandler>()
            GET("/api/kofu/hello", handler::hello)
            GET("/api/kofu", handler::json)
            GET("/api/kofu/isbns", handler::isbns)
            GET("/api/kofu/small/isbns", handler::smallIsbns)
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
    fun hello(request: ServerRequest): Mono<ServerResponse> =
        ServerResponse.ok().bodyValue(isbnSampleService.generateMessage())

    fun json(request: ServerRequest): Mono<ServerResponse> =
        ServerResponse.ok().bodyValue(ISBNMessage(isbnSampleService.generateMessage()))

    fun isbns(request: ServerRequest): Mono<ServerResponse> = ServerResponse.ok().bodyValue(ISBNS)
    fun smallIsbns(request: ServerRequest): Mono<ServerResponse> = ServerResponse.ok().bodyValue(SMALL_ISBNS)
}

class ISBNStacksKoFuReactiveLauncher {
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            app.run()
        }
    }

    class Companion__ApplicationContextInitializer :
        AotApplicationContextInitializer<ReactiveWebServerApplicationContext> {
        override fun initialize(applicationContext: ReactiveWebServerApplicationContext) {
            applicationContext.registerBean(ISBNSampleService::class.java, *arrayOf())
            applicationContext.registerBean(ISBNSampleHandler::class.java, ISBNSampleService())

        }
    }
}


