# Info

This Bash script helps you change your old commits author name and email in many repositories. 
This script uses the powerful command ``git push -f``.
You should be cautious when using the script. YOU HAVE BEEB WARNED.\
With great power comes great responsibility.
## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
$ git clone https://github.com/konmaz/changeComitAuthorBash.git
$ cd changeComitAuthorBash/
$ chmod +x script.sh

```

## Usage
First in the ``config.txt`` edit:
```bash
OLD EMAIL
NEW NAME
NEW EMAIL
```
In the ``repos.txt`` put the desired repositories to change the author name and email:

```bash
konmaz/changeComitAuthorBash
...
```
Runing
```bash
$ ./script.sh
```

## WARNING
These scripts come without warranty of any kind. Use them at your own risk. I assume no liability for the accuracy, correctness, completeness, or usefulness of any information provided by this site nor for any sort of damages using these scripts may cause.
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
