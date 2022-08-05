<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.mysql_error_rate_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_db_instance.spgl_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.spgl_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_default_route_table.rt_spgl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_internet_gateway.ig_spgl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.route_ig_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_secretsmanager_secret.spgl_db_pswd_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.mysql_password_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.sg_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sns_topic.user_alarms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.notify_user_sql_err_email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.notify_user_sql_err_sms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_subnet.subnet_public_first](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.subnet_public_second](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc_spgl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_kms_key.rds_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_secretsmanager_random_password.spgl_db_pwd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_random_password) | data source |
| [aws_secretsmanager_secret.spgl_db_pswd_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.mysql_password_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cw_alarm_desc"></a> [cw\_alarm\_desc](#input\_cw\_alarm\_desc) | Description of the cloudwatch alarm | `string` | n/a | yes |
| <a name="input_cw_alarm_name"></a> [cw\_alarm\_name](#input\_cw\_alarm\_name) | Name of the cloudwatch alarm | `string` | n/a | yes |
| <a name="input_db_pswd_scrt"></a> [db\_pswd\_scrt](#input\_db\_pswd\_scrt) | Secret Name to the Database password | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_rds_db_identifier"></a> [rds\_db\_identifier](#input\_rds\_db\_identifier) | Database Identifier | `string` | n/a | yes |
| <a name="input_rds_db_name"></a> [rds\_db\_name](#input\_rds\_db\_name) | Database name | `string` | n/a | yes |
| <a name="input_rds_db_username"></a> [rds\_db\_username](#input\_rds\_db\_username) | Database Username | `string` | n/a | yes |
| <a name="input_sns_notify_email"></a> [sns\_notify\_email](#input\_sns\_notify\_email) | Email to be notified when the topic publishes an alarm | `string` | n/a | yes |
| <a name="input_sns_notify_sms"></a> [sns\_notify\_sms](#input\_sns\_notify\_sms) | Phone number to be notified when the the SNS topic publishes an alarm | `string` | n/a | yes |
| <a name="input_sns_topic_display"></a> [sns\_topic\_display](#input\_sns\_topic\_display) | Display name of the MySql Error Topic | `string` | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Name of the MySql Error Topic | `string` | n/a | yes |
| <a name="input_tag_environment"></a> [tag\_environment](#input\_tag\_environment) | environment tag | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_new_db_endpoint"></a> [new\_db\_endpoint](#output\_new\_db\_endpoint) | n/a |
| <a name="output_new_db_name"></a> [new\_db\_name](#output\_new\_db\_name) | n/a |
| <a name="output_show_internet_gateway_id"></a> [show\_internet\_gateway\_id](#output\_show\_internet\_gateway\_id) | n/a |
| <a name="output_show_vpc"></a> [show\_vpc](#output\_show\_vpc) | n/a |
<!-- END_TF_DOCS -->