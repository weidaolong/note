package com.facedops.note.util.img;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;

import com.jhlabs.image.AbstractBufferedImageOp;

/**
 * 解决图像缩放质量差的问题
 * Image.SCALE_SMOOTH
 */
public class MyScaleFilter extends AbstractBufferedImageOp {

    private int width;
    private int height;

    /**
     * Construct a ScaleFilter.
     */
    public MyScaleFilter() {
        this(32, 32);
    }

    /**
     * Construct a ScaleFilter.
     * @param width the width to scale to
     * @param height the height to scale to
     */
    public MyScaleFilter(int width, int height) {
        this.width = width;
        this.height = height;
    }

    @Override
    public BufferedImage filter(BufferedImage src, BufferedImage dst) {
        if (dst == null) {
            ColorModel dstCM = src.getColorModel();
            dst = new BufferedImage(dstCM,
                    dstCM.createCompatibleWritableRaster(width, height),
                    dstCM.isAlphaPremultiplied(), null);
        }

        Image scaleImage = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        Graphics2D g = dst.createGraphics();
        g.drawImage(scaleImage, 0, 0, width, height, null);
        g.dispose();

        return dst;
    }

    @Override
    public String toString() {
        return "Distort/Scale";
    }
}
