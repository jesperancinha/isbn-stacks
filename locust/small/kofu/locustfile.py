from locust import HttpUser, task


class ISBNStacksTest(HttpUser):
    @task
    def retrieve_isbn_via_kofu_reactive(self):
        self.client.get("http://localhost:8080/api/kofu/small/isbns")
