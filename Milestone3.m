global key
InitKeyboard();
speed = 33;


while (1)
    pause (0.01); % duration must be shorter than 10 ms
    
    % Collision detector

    pressed1 = brick.TouchPressed(1);
    pressed2 = brick.TouchPressed(2);

    if (pressed1 || pressed2)
        brick.playTone(100, 500, 1);
        if (pressed1) 
            disp('Collision detected! (Right)');
        end
        if (pressed2)
            disp('Collision detected! (Left)');
        end
    end

    % AT check (commented out)
    % color = brick.ColorCode(3);
    % speed = 100;
    % if (color == 5)
    %     speed = 66;
    % elseif (color == 4)
    %     speed = 33;
    % elseif (color == 6)
    %     speed = 100;
    % end
    
    switch key
        case 'w'
            disp('Up Arrow Pressed!');
            disp("Speed: " + speed);
            brick.MoveMotor('AB', speed);
            % speed only updates after pressing w again
        case 's'
            disp('Down Arrow Pressed!');
            brick.MoveMotor('AB', (speed / 100 ) * (-33));
            % Reverse beeper
            brick.playTone(100, 300, 1);
        case 'a'
            disp('Left Arrow Pressed!');
            brick.MoveMotor('A', (speed / 100 ) * 50);
            brick.MoveMotor('B', (speed / 100 ) * (-50));
        case 'd'
            disp('Right Arrow Pressed!');
            brick.MoveMotor('B', (speed / 100 ) * 50);
            brick.MoveMotor('A', (speed / 100 ) * (-50));
        case 'shift'
            disp('Handbrake Pressed!');
            brick.StopAllMotors('Brake');
        % MT gear up
        case 'r'
            if (speed == 33)
                speed = 66;
                disp('Gear Up! (2)');
            elseif (speed == 66)
                speed = 100;
                disp('Gear Up! (3)');
            elseif (speed == 100)
                disp('Cannot Gear Up: Max Gear!');
            end
        % MT gear down
        case 'f'
            if (speed == 100)
                speed = 66;
                disp('Gear Down! (2)');
            elseif (speed == 66)
                speed = 33;
                disp('Gear Down! (1)');
            elseif (speed == 33)
                disp('Cannot Gear Down: Min Gear!');
            end
        % Forklift up
        case 't'
            disp('Raising Forklift!');
            brick.MoveMotor('C', 100);
        % Forklift down
        case 'g'
            disp('Lowering Forklift!');
            brick.MoveMotor('C', -100);
        case 'q'
            break;
        otherwise
            brick.StopAllMotors('Coast');
    end
end
CloseKeyboard();