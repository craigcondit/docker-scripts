rabbitmqadmin declare exchange name=test type=topic auto_delete=false internal=false durable=true
rabbitmqadmin declare queue name=test auto_delete=false durable=true
rabbitmqadmin declare binding source=test destination=test destination_type=queue routing_key='#'

