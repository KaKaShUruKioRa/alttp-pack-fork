# Darkens an image that comes from the French rom where colors are too light.
# We subtract 32 from each RGB value, keeping alpha unchanged.
# RGB values of 255 are abritrarily changed to 240 to avoid ending up much
# darker than the original.

from PIL import Image
import sys

def darken(filename):

    print('Darkening file:', filename)

    # Open the original image
    original_image = Image.open(filename)
    original_image = original_image.convert('RGBA')

    # Create a new image with the same dimensions as the original
    new_image = Image.new('RGBA', original_image.size)

    # Loop over each pixel in the original image and modify its color
    for x in range(original_image.width):
        for y in range(original_image.height):
            r, g, b, a = original_image.getpixel((x, y))
            new_r = 240 if r == 255 else max(0, r - 32)
            new_g = 240 if g == 255 else max(0, g - 32)
            new_b = 240 if b == 255 else max(0, b - 32)
            new_a = a
            new_image.putpixel((x, y), (new_r, new_g, new_b, new_a))

    # Save the new image to disk
    new_image.save(filename)

if len(sys.argv) <= 1:
    print('No input files specified')
else:
    for filename in sys.argv[1:]:
        darken(filename)
