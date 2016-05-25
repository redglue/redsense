/*
 * 
 * Copyright 2014, Armenak Grigoryan, and individual contributors as indicated
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 */
package com.strider.dataanonymizer.utils;

import java.util.regex.Pattern;

/**
 * Simple matcher to mimic SQL LIKE queries.
 * 
 * At the moment only "%", "_" and "?" are supported.
 * 
 * @author Zaahid Bateson
 */
public class LikeMatcher {
    
    private String regex;
    
    /**
     * Initializes a LikeMatcher with the given pattern.
     * 
     * @param pattern the LIKE query pattern
     */
    public LikeMatcher(String pattern) {
        // splitting on '?', '_', and '%' with look-behind and look-ahead so they're included in the split array
        String[] parts = pattern.split("((?<=[\\?\\_\\%])|(?=[\\?\\_\\%]))");
        StringBuilder reg = new StringBuilder("^");
        for (String part : parts) {
            if (part.equals("%")) {
                reg.append(".*?");
            } else if (part.equals("?") || part.equals("_")) {
                reg.append(".");
            } else {
                reg.append(Pattern.quote(part.toLowerCase()));
            }
        }
        reg.append("$");
        this.regex = reg.toString();
    }
    
    /**
     * Returns true if the given string matches the Like pattern.
     * 
     * @param str the string to test against
     * @return
     */
    public boolean matches(String str) {
        return str.toLowerCase().matches(regex);
    }
}