from datetime import datetime, timedelta

DAYS_OF_WEEK = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
    'Sunday'
]


def add_time(start_time, duration, specified_day=""):
  start_hour, start_minute = [int(x) for x in start_time[:-3].split(":")]
  meridian_indicator = start_time[-2:]
  start_hour += 12 if meridian_indicator == "PM" else 0
  start_datetime = datetime(1, 1, 1, hour=start_hour, minute=start_minute)

  duration_parts = duration.split(":")
  duration_timedelta = timedelta(hours=int(duration_parts[0]),
                                 minutes=int(duration_parts[1]))
  new_datetime = start_datetime + duration_timedelta

  days_difference = (new_datetime.day - start_datetime.day)
  day_label = ""
  if days_difference > 0:
    if days_difference == 1:
      day_label = "(next day)"
    else:
      day_label = f"({days_difference} days later)"

  if specified_day:
    specified_day = DAYS_OF_WEEK[(DAYS_OF_WEEK.index(specified_day.title()) +
                                  days_difference) % 7]

  new_time_result = f'{new_datetime.strftime(r"%-I:%M %p")}{(", " + specified_day) if specified_day else ""}{(" " + day_label) if days_difference != 0 else ""}'

  return new_time_result
