minutes = int(input("Enter minutes: "))

hrs = minutes // 60
mins = minutes % 60

if hrs > 0:
    if hrs == 1:
        print(f"{hrs} hr {mins} minutes")
    else:
        print(f"{hrs} hrs {mins} minutes")
else:
    print(f"{mins} minutes")
