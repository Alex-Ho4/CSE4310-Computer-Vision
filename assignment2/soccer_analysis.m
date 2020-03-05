function soccer_analysis(input)

    % get rgb values of the image
    input = double(input);
    r = input(:,:,1);
    g = input(:,:,2);
    b = input(:,:,3);

    % Field: find the pixels that are the most green, remove holes, and get
    % largest connected area
    field = ((g - r > 0) & (g - b > 0));
    field = remove_holes(field);
    field = bwareafilt((field > 1), 1);

    % Red players: find the players that are more red than blue or green at
    % given thresholds then make sure the pixels are on the field
    red_players = ((r - g > 100) & (r - b > 50));
    red_players = (field > 0 & red_players > 0);

    % Blue players: find the players that are more blue than red or green
    % at given thresholds then make sure the pixels are on the field
    blue_players = ((b - g > 35) & (b - r > 30));
    blue_players = (field > 0 & blue_players > 0);

    figure(1);
    imshow(field, []);
    figure(2);
    imshow(red_players, []);
    figure(3);
    imshow(blue_players, []);

end

