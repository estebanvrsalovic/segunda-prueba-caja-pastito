idf_component_register(SRCS "softap_example_main.c"
                    PRIV_REQUIRES esp_wifi nvs_flash esp_http_server app_update esp_netif
                    INCLUDE_DIRS ".")
