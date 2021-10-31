from locust import HttpUser, task


class ISBNStacksTest(HttpUser):
    @task
    def retrieve_isbn_via_traditional_non_reactive(self):
        self.client.get("http://localhost:8082/api/traditional/non/isbns")
