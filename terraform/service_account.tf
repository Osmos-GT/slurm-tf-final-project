resource "yandex_iam_service_account" "this" {
  name        = "my-service-account"
  description = "service account to manage my cloud"
}

resource "yandex_resourcemanager_folder_iam_binding" "this" {
  folder_id = "b1gev7tcl4ielhhk84b4"
  role      = "editor"
  members   = [
    "serviceAccount:${yandex_iam_service_account.this.id}",
  ]
}
