% Auto Mode for Milestone 3: Work in progress!

classDef autoMode
    methods(Static)
    function autoDrive(boolean go)
            if (go == false)
                return
            end
            else
                brick.MoveMotor('AB', speed);                
            end
        end
    end
end