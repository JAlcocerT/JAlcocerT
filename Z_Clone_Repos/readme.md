There are better ways to backup your repos, but this is a quick and dirty way to do it.

---

```sh
#python -m venv venv
#python3 -m venv venv

#.\venv\Scripts\activate
#source venv/bin/activate

pip install gspread oauth2client gitpython
```

```sh
python clone_repos.py
python3 clone_repos.py
```