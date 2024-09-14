# Directory containing the images
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers/"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Wallpaper directory does not exist: $WALLPAPER_DIR"
  exit 1
fi

swww init

while true; do
  # Get a random image from the directory
  RANDOM_IMAGE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  # Check if we got a valid image
  if [ -z "$RANDOM_IMAGE" ]; then
    echo "No images found in the directory: $WALLPAPER_DIR"
    exit 1
  fi

  # Echo the random image path
  # echo "Random image: $RANDOM_IMAGE"
  swww img "$RANDOM_IMAGE" --transition-type=any && wal -i "$RANDOM_IMAGE"

  # Wait for 15 seconds before repeating
  sleep 8
done
