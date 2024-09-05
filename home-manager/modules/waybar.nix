{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["hyprland/workspaces" "keyboard-state" "hyprland/submap"];
        modules-center = ["clock" "custom/weather"];
        modules-right = ["network" "pulseaudio" "bluetooth" "custom/mem" "cpu" "temperature" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        "hyprland/language" = {
          format-en = "US";
        };

        "keyboard-state" = {
          #numlock = true;
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
        };
    };

    "network"= {
      format = "{ifname}";
      format-wifi = "{essid} ({signalStrength}%) ";
      format-ethernet = "{ipaddr}/{cidr} 󰊗";
      format-disconnected = "";
      tooltip-format = "{ifname} via {gwaddr} 󰊗";
      tooltip-format-wifi = "{essid} ({signalStrength}%) ";
      tooltip-format-ethernet = "{ifname} ";
      tooltip-format-disconnected = "Disconnected";
      on-click = "nm-connection-editor";
      max-length = 50;
    };

    "bluetooth" = {
      format = " {status}";
      format-connected = " {device_alias}";
      format-connected-battery= " {device_alias} {device_battery_percentage}%";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
      on-click = "blueman-manager";
    };

    "clock" = {
      # timezone = "America/New_York";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format = "{:%a; %d %b, %I:%M %p}";
    };

    "pulseaudio" = {
      # scroll-step = 1; # %, can be a float
      reverse-scrolling = 1;
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = "{icon} {format_source}";
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = ["" "" ""];
      };
      on-click = "pavucontrol";
      min-length = 13;
    };

    "custom/mem" = {
      format = "{} ";
      interval = 3;
      exec = "free -h | awk '/Mem:/{printf $3}'";
      tooltip = false;
    };

    "cpu" = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };

    "temperature" = {
      # thermal-zone = 2;
      # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      critical-threshold = 80;
      # format-critical = "{temperatureC}°C {icon}";
      format = "{temperatureC}°C {icon}";
      format-icons = ["" "" "" "" ""];
      tooltip = false;
    };

    tray = {
      icon-size = 10;
      spacing = 0;
    };

  };
};

style = 
''
* {
  border: none;
  border-radius: 0;
  font-family: JetBrains Mono;
  font-weight: bold; 
  font-size: 14px;
}

window#waybar {
  background: transparent;
}

window#waybar.hidden {
  opacity: 0.2;
}

#workspaces {
  margin-right: 8px;
  border-radius: 10px;
  transition: none;
  background: #383c4a;
}

#workspaces button {
  transition: none;
  color: #7c818c;
  background: transparent;
  padding: 5px;
  font-size: 12px;
}

#workspaces button.persistent {
  color: #7c818c;
  font-size: 12px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
  transition: none;
  box-shadow: inherit;
  text-shadow: inherit;
  border-radius: inherit;
  color: #383c4a;
  background: #7c818c;
}

#workspaces button.active {
  background: #4e5263;
  color: white;
  border-radius: inherit;
}

#language {
  padding-left: 8px;
  padding-right: 8px;
  border-radius: 10px 10px 10px 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#keyboard-state {
  margin-right: 8px;
  padding-right: 8px;
  border-radius: 10px 10px 10px 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#custom-pacman {
  padding-left: 16px;
  padding-right: 8px;
  border-radius: 10px 0px 0px 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#custom-mail {
  margin-right: 8px;
  padding-right: 16px;
  border-radius: 0px 10px 10px 0px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#submap {
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#clock {
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px 10px 10px 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#pulseaudio {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#pulseaudio.muted {
  background-color: #90b1b1;
  color: #2a5c45;
}

#network {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#bluetooth {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#custom-mem {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#cpu {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#temperature {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#temperature.critical {
  background-color: #eb4d4b;
}

#backlight {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#battery {
  margin-right: 8px;
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

#battery.charging {
  color: #ffffff;
  background-color: #26A65B;
}

#battery.warning:not(.charging) {
  background-color: #ffbe61;
  color: black;
}

#battery.critical:not(.charging) {
  background-color: #f53c3c;
  color: #ffffff;
  animation-name: blink;
  animation-duration: 0.5s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

#tray {
  padding-left: 16px;
  padding-right: 16px;
  border-radius: 10px;
  transition: none;
  color: #ffffff;
  background: #383c4a;
}

@keyframes blink {
  to {
    background-color: #ffffff;
    color: #000000;
  }
}
'';
  };
}
