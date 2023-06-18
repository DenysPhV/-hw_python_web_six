from random import randint, choice
from faker import Faker
from datetime import datetime, date, timedelta
import sqlite3

from pprint import pprint

disciplines = [
    "Hightest math",
    "Discret math",
    "Line Algebra",
    "Programming",
    "Probability theory",
    "History of Ukraine",
    "English",
    "Drawing"
]


groups = ["E331", "E450", "G558"]
NUMBER_TEACHER = 5
NUMBER_STUDENTS = 50
fake = Faker()

connect = sqlite3.connect('hw.db')
cur = connect.cursor()


def seed_teacher():
    teachers = [fake.name() for _ in range(NUMBER_TEACHER)]
    sql = "INSERT INTO teachers(fullname) VALUES(?);"
    cur.executemany(sql, zip(teachers,))


def seed_disciplines():
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql, zip(disciplines, iter(randint(1, NUMBER_TEACHER) for _ in range(len(disciplines)))))


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES(?);"
    cur.executemany(sql, zip(groups,))


def seed_student():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    cur.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades():
    start_date = datetime.strptime("2023-01-16", "%Y-%m-%d")
    end_date = datetime.strptime("2023-11-30", "%Y-%m-%d")
    sql = "INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);"

    def get_list_date(start: date, end: date):
        result = []
        current_day = start

        while current_day <= end:
            if current_day.isoweekday() < 6:
                result.append(current_day)
            current_day += timedelta(1)

        return result

    list_dates = get_list_date(start_date, end_date)

    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_STUDENTS) for _ in range(5)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 12), day.date()))
    cur.executemany(sql, grades)


if __name__ == '__main__':
    try:
        seed_teacher()
        seed_disciplines()
        seed_groups()
        seed_student()
        seed_grades()
        connect.commit()
    except sqlite3.Error as error:
        pprint(error)
    finally:
        connect.close()