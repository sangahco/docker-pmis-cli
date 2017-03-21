# PMIS Scripting Environment

Use this image for running Jython script

The following environment variables are required:

- **ES_HOST** (*required)
- **ES_PORT** (*required)
- **ES_CLUSTER** (*required)

- **DB_URI**
- **DB_USERNAME**
- **DB_PASSWORD**

If the *DB_* variables are missing, before the execution the service will ask the user to insert these information.

# How to use

See the available scripts with:

    $ ./docker-auto.sh --prod run

    Script available:
    total 36
    -rwxrwxrwx 1 root root  509 Mar 20 05:23 dbpwd_encrypt.py
    -rwxrwxrwx 1 root root 2784 Mar 20 05:23 docs_export.py
    -rwxrwxrwx 1 root root 1222 Mar 20 05:23 es_menu_export.py
    -rwxrwxrwx 1 root root  817 Mar 21 01:07 example.py
    -rwxrwxrwx 1 root root 3248 Mar 20 05:23 pylog.py
    -rwxrwxrwx 1 root root 2925 Mar 20 05:23 review_files_export.py
    -rwxrwxrwx 1 root root  129 Mar 20 05:23 update_test.py
    -rwxrwxrwx 1 root root 1698 Mar 20 05:23 user-import.py
    -rwxrwxrwx 1 root root 2369 Mar 20 05:23 webhard_export.py


Run the script with:

    $ ./docker-auto.sh --prod run example.py

You can run custom scripts, putting them inside the folder `scripts` and than lunch them with the previous command.

