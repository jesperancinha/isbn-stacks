package org.jesperancinha.spring

import kotlin.math.pow
import kotlin.random.Random

data class IsbnDto(
    val Isbn: String
) {
    companion object {
        val ISBNS =
            (1..500_000).map { IsbnDto(Random.nextLong(10f.pow(12).toLong(), 10f.pow(13).toLong() - 1).toString()) }
    }
}


