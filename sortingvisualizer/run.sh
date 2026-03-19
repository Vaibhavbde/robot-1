#!/bin/bash
# ===============================================
# Compile all Java files recursively and run program
# ===============================================

# Step 0: Go to folder where script is located
cd "$(dirname "$0")" || exit 1

# Step 1: Find all .java files
echo "Finding all Java files..."
find . -name "*.java" > all_java_files.txt

# Step 2: Compile all files at once
echo "Compiling all Java files..."
javac -d . @all_java_files.txt
if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    rm all_java_files.txt
    exit 1
fi

# Step 3: Cleanup temp file
rm all_java_files.txt

# Step 4: Run the main class
echo
echo "Compilation finished successfully!"
echo "Launching Sorting Visualizer..."
java -cp . sortingvisualizer.SortingVisualizer