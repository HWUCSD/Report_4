rm rf student-submission
git clone $1 student-submission

if [[ -e ListExamples.java ]]
then 
    echo "submittion succefull, +1"
    ((GRADE++))
else 
    echo "missing, -1 point"
    exit 1
fi

if [[ -f ListExamples.java ]]
then
    "file founded"
else
    echo "file not founeded"
    exit 1
fi
cd student-submission
javac -cp $CPATH *.java 2> output-error.txt

[ -s stderr.txt]

if [ $? -eq 0 ]

then
    echo "not complie"

else
    echo "complied"

fi

set +e
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java

if [$? == 0]
    echo "1 score"
    exit 1
    else
    echo "0 score"
    exit 1
fi