#include <wchar.h>
#include <stdio.h>
#include <string.h>
#include <locale.h>
// The file '/sys/class/power_supply/BAT0/capacity' outputs the current charge
// percentage level as an integer. Example output: '43'.

// The file '/sys/class/power_supply/BAT0/status' outputs the current charging
// status as a string. Example output: 'Discharging'.

/**
 * Battery icons:
 *      critical:  f244
 */

// battery icons
int icon_empty[] = L"";
int icon_low[] = L"";
int icon_half[] = L"";
int icon_high[] = L"";
int icon_full[] = L"";

// charging icon
int icon_charging[] = L"ﮣ";

// polybar format strings
int textcolor_default[] = L"%{F-}";     // fg color unset
int textcolor_empty[] = L"%{F#ff0000}"; // red
int textcolor_low[] = L"%{F#ffa000}";      // orange
int textcolor_half[] = L"%{F-}";
int textcolor_high[] = L"%{F-}";
int textcolor_full[] = L"%{F-}";

int main() {
    // load locale information
    if (!setlocale(LC_ALL, "")) {
      fprintf(stderr, "Failed to set LC_ALL from the locale.\n");
      return 1;
    }


    // open battery capacity file
    FILE * capacity_file;
    char capacity_file_path[] = "/sys/class/power_supply/BAT0/capacity";
    capacity_file = fopen(capacity_file_path, "r");
    if (capacity_file == NULL) {
        fprintf(stderr, "Failed to open '%s'.\n", capacity_file_path);
        return 1;
    }
    // read charge percentage
    int current_charge;
    if (fscanf(capacity_file, "%i", &current_charge) == EOF) {
        fprintf(stderr, "Failed to read '%s'.\n", capacity_file_path);
        return 1;
    }
    fclose(capacity_file);
    // print charge percentage and appropriate battery symbol
    if (current_charge >= 80) {
        printf("%ls%i%% %ls%ls", textcolor_full, current_charge, textcolor_default, icon_full);
    } else if (current_charge < 80 && current_charge >= 60) {
        printf("%ls%i%% %ls%ls", textcolor_high, current_charge, textcolor_default, icon_high);
    } else if (current_charge < 60 && current_charge >= 40) {
        printf("%ls%i%% %ls%ls", textcolor_half, current_charge, textcolor_default, icon_half);
    } else if (current_charge < 40 && current_charge >= 20) {
        printf("%ls%i%% %ls%ls", textcolor_low, current_charge, textcolor_default, icon_low);
    } else {
        printf("%ls%i%% %ls%ls", textcolor_empty, current_charge, textcolor_default, icon_empty);
    }


    // open battery status file
    FILE * status_file;
    char status_file_path[] = "/sys/class/power_supply/BAT0/status";
    status_file = fopen(status_file_path, "r");
    if (status_file == NULL) {
        fprintf(stderr, "Failed to open '%s'.\n", status_file_path);
        return 1;
    }
    // read battery status
    char status[32];
    if (fscanf(status_file, "%s", status) == EOF) {
        fprintf(stderr, "Failed to read '%s'.\n", status_file_path);
        return 1;
    }
    fclose(status_file);
    // print charger icon
    if (strcmp(status, "Charging") == 0) {
        printf(" %ls", icon_charging);
    }


    printf("\n");
    return 0;
}
