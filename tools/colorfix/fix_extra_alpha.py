# Fixes the alpha channel of an image that was pasted by mistake
# onto itself with alpha blending.

from PIL import Image
import sys

def filter_value(alpha):
    if alpha == 255:
        return alpha
    alpha = int(255 - ((65025 - 255*alpha)**0.5))
    return max(0, min(255, alpha))

def fix_extra_alpha(filename):

    print('Removing extra alpha of file:', filename)

    # Open the original image
    original_image = Image.open(filename)
    original_image = original_image.convert('RGBA')

    # Extract the alpha channel from the image
    alpha_channel = original_image.getchannel('A')

    # Compute the restored alpha values using the reverse alpha blending formula
    restored_alpha_channel = Image.new('L', alpha_channel.size)
    for i in range(alpha_channel.size[0]):
        for j in range(alpha_channel.size[1]):
            alpha = alpha_channel.getpixel((i,j))
            alpha = filter_value(alpha)
            restored_alpha_channel.putpixel((i,j), alpha)

    # Replace the original alpha channel with the restored alpha channel in the image
    restored_image = original_image.copy()
    restored_image.putalpha(restored_alpha_channel)

    # Save the new image to disk
    restored_image.save(filename)

if len(sys.argv) <= 1:
    print('No input files specified')
else:
    for filename in sys.argv[1:]:
        fix_extra_alpha(filename)
