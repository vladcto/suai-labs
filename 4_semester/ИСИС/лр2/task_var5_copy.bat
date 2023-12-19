@echo off
cd Variant5 
tree /f
set /p _source="Enter catalog source name: "
set /p _destination="Enter the name of the copy destination directory: "
set /p _source_file ="Enter copy file name: "
xcopy %_source%\%_source_file% %_destination%
tree /f
cd ..