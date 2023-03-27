## WM_LISTDIR ScriptWM_LISTDIR Script

This Bash script lists the last 30 pipeline files in the Integration Server directory and writes them to a log file. It also allows you to specify the number of files to display by passing a parameter to the script.

### Usage

The script can be executed by running the following command:


```bash
./wm_listdir.sh [optional: number_of_files]
```

If no parameter is passed, the default number of files displayed is 10. The script determines the Integration Server directory by checking if specific directories exist, and creates a temporary file to store the list of pipeline files.

The most recent pipeline files are listed in the specified directory and written to the temporary file. The last 30 files from the temporary file are then written to a log file, with a separator "#@" between each file name. The number of files to display is specified by the optional parameter passed to the script.

After displaying the files, the script removes the temporary and log files.

### Variables

The script uses the following variables:

- temporaray_file: A temporary file to store the list of pipeline files.
- logfile: A log file to store the last 30 pipeline files.
- plfiles: A counter to keep track of the number of pipeline files displayed.
- param_fr_wm: The number of files to display. If no parameter is passed, it defaults to 10.
- IS_Directory: The directory for the Integration Server. The script checks if specific directories exist and sets the variable accordingly.

### Example
To display the last 20 pipeline files, run the script with the following command:

```bash
./wm_listdir.sh 20
```