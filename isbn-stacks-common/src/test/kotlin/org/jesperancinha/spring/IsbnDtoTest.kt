package org.jesperancinha.spring

import io.kotest.matchers.collections.shouldHaveSize
import io.kotest.matchers.longs.shouldBeBetween
import org.junit.jupiter.api.Test

internal class IsbnDtoTest {

    @Test
    fun `should fall within ISBN 13 range`() {
        IsbnDto.ISBNS.shouldHaveSize(500000)
        IsbnDto.ISBNS.forEach {
            it.isbn.toLong().shouldBeBetween(1000000000000, 9999999999999)
        }
    }
}