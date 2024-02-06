#resource "null_resource" "run_api" {
#  provisioner "local-exec" {
#    command = "curl -X POST -H 'Content-Type: application/json' -H 'Authorization: Bearer AUTH_TOKEN' -d '{\"name\": \"Agent policy 6\", \"description\": \"\", \"namespace\": \"default\", \"monitoring_enabled\": [\"logs\", \"metrics\"], \"inactivity_timeout\": 1209600, \"is_protected\": false}' http://${var.ELK_URL}/api/fleet/agent_policies?sys_monitoring=true"
#    environment = {
#      AGENT_POLICY_ID = var.agent_policy_id
#      AUTH_TOKEN = var.Elastic_API_Key
#    }
#  }
#}
#
#resource "null_resource" "run_api2" {
#  provisioner "local-exec" {
#    command = "curl -X POST -H 'Content-Type: application/json' -d '{\"policy_id\": \"${var.agent_policy_id}\", \"package\": {\"name\": \"azure\", \"version\": \"1.7.0\"}, \"name\": \"azure-1\", \"description\": \"\", \"namespace\": \"default\", \"inputs\": {\"eventhub-azure-eventhub\": {\"enabled\": true, \"streams\": {\"azure.eventhub\": {\"enabled\": true, \"vars\": {\"parse_message\": false, \"preserve_original_event\": false, \"data_stream.dataset\": \"azure.eventhub\", \"tags\": [\"azure-eventhub\", \"forwarded\"], \"sanitize_newlines\": false, \"sanitize_singlequotes\": false}}}}, \"adlogs-azure-eventhub\": {\"enabled\": false, \"streams\": {\"azure.auditlogs\": {\"enabled\": false, \"vars\": {\"preserve_original_event\": false, \"tags\": [\"azure-auditlogs\", \"forwarded\"], \"sanitize_newlines\": false, \"sanitize_singlequotes\": false}}, \"azure.identity_protection\": {\"enabled\": false, \"vars\": {\"preserve_original_event\": false, \"tags\": [\"azure-identity-protection-logs\", \"forwarded\"], \"sanitize_newlines\": false, \"sanitize_singlequotes\": false}}, \"azure.provisioning\": {\"enabled\": false, \"vars\": {\"preserve_original_event\": false, \"tags\": [\"azure-provisioning-logs\", \"forwarded\"], \"sanitize_newlines\": false, \"sanitize_singlequotes\": false}}}}}' http://${var.ELK_URL}/api/fleet/package_policies"
#    #environment = {
#    #  AGENT_POLICY_ID = var.agent_policy_id
#    #}
#  }
#}

resource "null_resource" "create_agent_policy" {
  # Your other resource configuration here...

  provisioner "local-exec" {
    command = <<-EOT
      curl -k -X POST "https://${var.ELK_URL}/api/fleet/agent_policies?sys_monitoring=true" \
        -H "Authorization: ApiKey ${var.Elastic_API_Key}" \
        -H "Content-Type: application/json" \
        -H "kbn-xsrf: reporting" \
        -d '{
          "name": "Agent policy TEST4",
          "description": "",
          "namespace": "default",
          "monitoring_enabled": [
            "logs",
            "metrics"
          ]
        }'
    EOT
  }
}

resource "null_resource" "create_package_policy" {
  # Your other resource configuration here...

  provisioner "local-exec" {
    command = <<-EOT
      curl -X POST "https://${var.ELK_URL}/api/fleet/package_policies" \
-H "Content-Type: application/json" \
-d '{
  "policy_id": "8950acc0-c508-11ee-8363-d9aaa660e3db",
  "package": {
    "name": "azure",
    "version": "1.7.0"
  },
  "name": "azure-1",
  "description": "test",
  "namespace": "default",
  "inputs": {
    "eventhub-azure-eventhub": {
      "enabled": true,
      "streams": {
        "azure.eventhub": {
          "enabled": true,
          "vars": {
            "parse_message": false,
            "preserve_original_event": false,
            "data_stream.dataset": "azure.eventhub",
            "tags": [
              "azure-eventhub",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "adlogs-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.auditlogs": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-auditlogs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        },
        "azure.identity_protection": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-identity-protection-logs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        },
        "azure.provisioning": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-provisioning-logs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        },
        "azure.signinlogs": {
          "enabled": false,
          "vars": {
            "tags": [
              "azure-signinlogs",
              "forwarded"
            ],
            "preserve_original_event": false,
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "platformlogs-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.platformlogs": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-platformlogs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "activitylogs-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.activitylogs": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-activitylogs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "springcloudlogs-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.springcloudlogs": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-springcloudlogs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "firewall_logs-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.firewall_logs": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-firewall",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    },
    "application_gateway-azure-eventhub": {
      "enabled": false,
      "streams": {
        "azure.application_gateway": {
          "enabled": false,
          "vars": {
            "preserve_original_event": false,
            "tags": [
              "azure-application-gateway-logs",
              "forwarded"
            ],
            "sanitize_newlines": false,
            "sanitize_singlequotes": false
          }
        }
      }
    }
  },
  "vars": {
    "eventhub": "test",
    "consumer_group": "$Default",
    "connection_string": "test",
    "storage_account": "test",
    "storage_account_key": "test"
  }
}'
    EOT
  }
}


