# FPGA Digital Clock and Stopwatch ⏱️

This repository contains the full implementation of a **Digital Clock with Stopwatch** designed in **VHDL** and tested on an **Intel/Altera Cyclone V FPGA**.  
The project showcases modular digital design using counters, comparators, debouncers, and display drivers, with accurate real-time performance and a stopwatch feature.

---

## 📖 Project Overview
The system was developed as part of a CEN466 course project.  
It demonstrates how **FPGA-based systems** can provide precise, efficient, and scalable digital timekeeping compared to traditional microcontroller solutions:contentReference[oaicite:0]{index=0}.

- **Digital Clock**: Displays hours, minutes, and seconds.  
- **Stopwatch**: Independent counters for seconds and hundredths of seconds.  
- **User Interaction**: Pushbuttons and switches to control start, stop, reset, and display mode.  
- **Display**: Four multiplexed 7-segment displays with Binary-to-BCD conversion.  
- **FPGA Advantage**: Real-time, parallel processing with reliable timing and scalability:contentReference[oaicite:1]{index=1}.

---

## 📂 Repository Structure
- `accu.vhd` – Accumulator/counter module.  
- `comparator.vhd` – Generic comparator for overflow and state transitions.  
- `debouncer.vhd` – Stabilizes push button input signals.  
- `binaryToBCD.vhd` – Converts binary values to BCD.  
- `bcdtoseven.vhd` – BCD to 7-segment driver.  
- `ADSD.vhd` – Top-level design integrating clock and stopwatch.  

---

## 🛠️ Design Details
### Key Components
1. **Counters (accu.vhd)** – Track seconds, minutes, hours, and stopwatch values.  
2. **Comparators (comparator.vhd)** – Detect counter limits and handle cascading increments.  
3. **Debouncer (debouncer.vhd)** – Ensures reliable push button interaction:contentReference[oaicite:2]{index=2}.  
4. **Converters** – Binary-to-BCD and BCD-to-Seven-Segment for display logic.  
5. **Mode Control** – Multiplexing logic allows selecting between:
   - Seconds/Minutes  
   - Minutes/Hours  
   - Stopwatch  

### FPGA Board
- **Cyclone V (5CGXFC5C6F27C7N)**  
- Push buttons for increment/reset/start/stop  
- Switches for mode selection  
- 7-Segment display output:contentReference[oaicite:3]{index=3}  

---

## 🔬 Testing and Results
- **Digital Clock**: Verified against a real clock for accuracy.  
- **Stopwatch**: Start, pause, resume, and reset functions worked reliably without interfering with the clock:contentReference[oaicite:4]{index=4}.  
- **Manual Increment**: Extra feature to set hours and minutes manually.  
- **Result**: Real-time performance, stable user inputs, and accurate display updates.  

---

## 📊 Analysis and Conclusion
- FPGA-based digital clocks are **accurate, flexible, and efficient**.  
- Modular VHDL design makes the system extensible (alarms, multi-format time, advanced displays).  
- Lessons learned include synchronization, debouncing, and FPGA resource optimization.  
- Potential future improvements:
  - Integration with RTC modules (DS3231/DS1307).  
  - Support for 12/24-hour formats.  
  - LCD or OLED display integration.  
  - Alarm functionality:contentReference[oaicite:5]{index=5}.  

---

## 🎥 Demo
[YouTube Demonstration](https://youtu.be/nZoi-eKxg-M?si=f2RKiwQOzfBC69HJ)  
