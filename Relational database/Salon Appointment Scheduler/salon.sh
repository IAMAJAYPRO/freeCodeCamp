#! /bin/bash
PSQL="psql  --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
    if [[ $1 ]]
    then
        echo -e "\n$1"
    else
        echo -e "Welcome to My Salon, how can I help you?"
    fi
    DISPLAY_MENU
    read SERVICE_ID_SELECTED
    
    
    if [[ -z $SERVICE_ID_SELECTED || -z $($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED") ]]
    then
        MAIN_MENU "I could not find that service. What would you like today?"
    else
        SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
        SERVICE_NAME=$(echo $SERVICE_NAME|sed -E 's/^ *| *$//g' )
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_PHONE=$(echo $CUSTOMER_PHONE|sed -E 's/^ *| *$//g' )
        SELECT_CUSTOMER_ID_RESULT=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
        if [[ -z $SELECT_CUSTOMER_ID_RESULT ]]
        then
            ADD_CUSTOMER
        fi
        
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
        CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
        CUSTOMER_NAME=$(echo $CUSTOMER_NAME|sed -E 's/^ *| *$//g' )
        ADD_APPOINTMENT
        
    fi
}

ADD_CUSTOMER(){
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name,phone) values ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
}


ADD_APPOINTMENT(){
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}


DISPLAY_MENU(){
    AVAILABLE_SERVICES=$($PSQL "select service_id,name from services;")
    echo ""
    echo "$AVAILABLE_SERVICES" | while read service_id bar name
    do
        echo -e "$service_id) $name"
    done
}



MAIN_MENU