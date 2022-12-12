#! /bin/bash
PSQL="psql  --username=freecodecamp --dbname=salon  --tuples-only -c"
SHOW_SERVICES() {
  # Display a numbered list of the services you offer before the fisrt prompt for input
  # each with the format #) <service>
  SERVICES=$($PSQL "SELECT * FROM services")
  echo -e "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}
# prompt users to enter a service_id
GET_SERVICE_ID() {
  SHOW_SERVICES
  echo "Please choose number of the service you want:"
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]
  then
    # display services again
    GET_SERVICE_ID
  fi
}

GET_CUSTOMER_ID() {
  # get customer's phone number
  echo "Please enter your phone number:"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE' ")
  if [[ -z $CUSTOMER_ID ]]
  then
    # get customer's name if they aren't already a customer
    echo "Please enter your name:"
    read CUSTOMER_NAME
    # insert into customers table
    ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE' ")
  fi
  echo "customer id:$CUSTOMER_ID"
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
}

GET_TIME() {
  # get the time from customer
  echo "Please choose the time you prefer:"
  read SERVICE_TIME
}

MAKE_APPOINTMENT() {
  echo $SERVICE_ID $CUSTOMER_ID $SERVICE_TIME
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
  echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME,$CUSTOMER_NAME."
}

GET_SERVICE_ID
GET_CUSTOMER_ID
GET_TIME
MAKE_APPOINTMENT



