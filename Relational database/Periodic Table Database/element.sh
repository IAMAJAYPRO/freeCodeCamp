
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
select_statement="select atomic_number,symbol,name,atomic_mass,melting_point_celsius,boiling_point_celsius,type from elements inner join properties using (atomic_number) inner join types using (type_id) "

PRINT_INFO(){
    echo $element_result | while IFS="|" read atomic_number symbol name atomic_mass melting_point_celsius boiling_point_celsius type
    do
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
    done
}

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else
    ELEMENT="$1"
    if [[ $ELEMENT =~ ^[0-9]+$ ]]
    then
        #echo "debug atomic_number"
        element_result=$($PSQL "$select_statement where atomic_number=$ELEMENT;")
    elif [[ "$( echo "$ELEMENT" | wc -m )" -le 3 ]] #actually <=2 as 1 for \n from echo 
    then
        #echo "debug symbol $( echo "$ELEMENT" | wc -m )"
        element_result=$($PSQL "$select_statement where symbol='$ELEMENT';")
    else
        #echo "debug name"
        element_result=$($PSQL "$select_statement where name='$ELEMENT';")
    fi

    if [[ -z $element_result ]]
    then
        echo "I could not find that element in the database."
    else
        PRINT_INFO
    fi
fi