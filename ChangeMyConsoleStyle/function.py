import random
import re
ThemePath = r'C:/Users/three/AppData/Local/Programs/oh-my-posh/themes/'
ps1Path = r'C:/Users/three/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'
txtPath = r'./1.txt'


def Changeps1File(NametoChange):
    try:
        with open(ps1Path, 'r') as f:
            Contents = f.readlines()
        Change = re.sub(r'\"(.*?)\"', rf'"{ThemePath}{NametoChange}"', Contents[0])
        with open(ps1Path, 'w') as f:
            f.write(Change)
            f.write("Import-Module DirColors")
        print("ps1 file changed successfully!")
    except IOError as e:
        print(f"An IOError occurred: {e}")

def Readtxt():
    try:
        with open(txtPath, 'r') as f:
            c = f.readlines()
        return c
    except IOError as e:
        print(f"An IOError occurred: {e}")
        return None

def ChangetxtFile(Content, Flagindex, Direction, i):
    try:
        if Flagindex == 0 and Direction == 'up':
            Content[Flagindex] = 'flagdown\n'
        elif Flagindex == 38 and Direction == 'down':
            Content[Flagindex] = 'flagup\n'
        
        else:
            Move = Content.pop(i)
            if Direction == 'up':
                Content.append(Move)
            else:
                Content.insert(0, Move)

        with open(txtPath, 'w') as f:
            f.writelines(Content)
        
        print("txt file changed successfully!")
    except IOError as e:
        print(f"An IOError occurred: {e}")


if __name__ == '__main__':
    print("Changing your console style...")
    try:
        Content = Readtxt()
        if Content:
            Flagindex = Content.index([i for i in Content if "flag" in i][0])
            Direction = 'up' if 'up' in Content[Flagindex] else 'down'
            i = random.randint(0, Flagindex if Direction == 'up' else len(Content)-1)

            if Flagindex == 0 and Direction == 'up':
                ChangetxtFile(Content, Flagindex, Direction, i)
            elif Flagindex == 38 and Direction == 'down':
                ChangetxtFile(Content, Flagindex, Direction, i)
            else:
                Changeps1File(Content[i].replace('\n',''))
                ChangetxtFile(Content, Flagindex, Direction, i)

            print("Done!")
        else:
            print("Failed to read txt file.")
    except ValueError:
        print("Error finding the flag in the content.")