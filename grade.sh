CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [ -f ListExamples.java ]
then
    echo 'File found'
else 
    echo 'File not found'
fi 

cp ListExamples.java ../grading-area
cp ../TestListExamples.java ../grading-area
cp -r ../lib ../grading-area

javac ../grading-area.ListExamples.java 2> ../error.output.txt
cd ../grading-area
javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java 2> ../error2.output.txt
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
