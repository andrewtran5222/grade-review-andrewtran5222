CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then
    echo "ListExamples found"
else
    echo "Missing ListExamples file"
    exit 1
fi

cp ../TestListExamples.java ./
cp -r ../lib ./

javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 

if [[ $? -ne 0 ]]
then
    echo "Files did not compile"
else
    echo "Files successfully compiled"
fi


java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > output.txt
cat output.txt