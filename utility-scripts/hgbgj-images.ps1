<#
.SYNOPSIS
Utility script to process images for the HGBGJ website.

.DESCRIPTION
This script requires ImageMagick to be installed and added to the PATH environment variable.
It should be run from the directory containing the images to be processed. It will create a
subdirectory called "images" and save the processed images there. The names of the processed
images will be based on the name of the current directory and the order in which the images are
processed.
#>

# Current directory
$currentPath = Get-Location

# Get the name of the current directory (folder name)
$folderName = Split-Path -Path $currentPath -Leaf

# Create an "images" subdirectory for output
$outputPath = Join-Path $currentPath "images"
New-Item -Path $outputPath -ItemType Directory -Force

# Target aspect ratio (16:9)
$targetAspectRatio = 16 / 9

# Image sizes and quality
$mainSize = "1920x1080"
$thumbnailSize = "400x225"
$quality = 90

# Initialize counter
$counter = 1

# Process each image in the current directory
Get-ChildItem -Path $currentPath -Include *.jpg, *.png -Recurse | ForEach-Object {
    # Define output file names using the folder name
    $mainFileName = "${folderName}_image${counter}_full.webp"
    $thumbnailFileName = "${folderName}_image${counter}_thumb.webp"
    
    # Calculate aspect ratio of the current image
    $image = [System.Drawing.Image]::FromFile($_.FullName)
    $currentAspectRatio = $image.Width / $image.Height

    # Determine cropping dimensions
    $cropGeometry = ""
    if ($currentAspectRatio -gt $targetAspectRatio) {
        # Image is wider than 16:9, crop horizontally
        $newWidth = [Math]::Floor($image.Height * $targetAspectRatio)
        $xOffset = [Math]::Floor(($image.Width - $newWidth) / 2)
        $cropGeometry = $newWidth.toString() + "x" + $image.Height.toString() + "+" + $xOffset.toString() + "+0"
    } elseif ($currentAspectRatio -lt $targetAspectRatio) {
        # Image is taller than 16:9, crop vertically
        $newHeight = [Math]::Floor($image.Width / $targetAspectRatio)
        $yOffset = [Math]::Floor(($image.Height - $newHeight) / 2)
        $cropGeometry = $image.Width.toString() + "x" + $newHeight.toString() + "+0+" + $yOffset.toString()
    }
	Write-Host "Cropping parameter: '$cropGeometry'."
	# Dispose of the image
	$image.Dispose()

    # Full-size image processing
    $mainFilePath = Join-Path $outputPath $mainFileName
    if ($cropGeometry -ne "") {
        # Crop, resize, and set quality
        magick convert $_.FullName -crop $cropGeometry -resize $mainSize -quality $quality $mainFilePath
    } else {
        # Just resize and set quality if aspect ratio is already 16:9
        magick convert $_.FullName -resize $mainSize -quality $quality $mainFilePath
    }

    # Thumbnail processing
    $thumbnailFilePath = Join-Path $outputPath $thumbnailFileName
    magick convert $mainFilePath -thumbnail $thumbnailSize -quality $quality $thumbnailFilePath

    # Increment the counter
    $counter++
}

# Output message
Write-Host "Image processing completed. Images are saved in '$outputPath'."
