from locust import HttpUser, task


class ISBNStacksTest(HttpUser):
    @task
    def retrieve_isbn_via_traditional_reactive(self):
        self.client.get("http://localhost:8081/api/traditional/isbns")
