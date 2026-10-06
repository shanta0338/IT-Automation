import PIL.Image
import pandas as pd
image = PIL.Image.open(r"C:\Users\Alpha\Pictures\Screenshots\Screenshot 2026-09-03 110920.png")
print(image.size)

visitors = [1235, 6424, 9345, 8464, 2345]
errors = [23, 45, 33, 45, 76]
df = pd.DataFrame({'Visitors': visitors, 'Errors': errors}, 
                  index= ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'])
print(df)