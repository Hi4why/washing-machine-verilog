`timescale 10ns / 1ps

module automatic_washing_machine_tb;

    reg clk;
    reg reset;
    reg door_close;
    reg start;
    reg filled;
    reg detergent_added;
    reg cycle_timeout;
    reg drained;
    reg spin_timeout;

    wire door_lock;
    wire motor_on;
    wire fill_value_on;
    wire drain_value_on;
    wire done;
    wire soap_wash;
    wire water_wash;

    // DUT Instantiation
    automatic_washing_machine DUT (
        .clk(clk),
        .reset(reset),
        .door_close(door_close),
        .start(start),
        .filled(filled),
        .detergent_added(detergent_added),
        .cycle_timeout(cycle_timeout),
        .drained(drained),
        .spin_timeout(spin_timeout),
        .door_lock(door_lock),
        .motor_on(motor_on),
        .fill_value_on(fill_value_on),
        .drain_value_on(drain_value_on),
        .done(done),
        .soap_wash(soap_wash),
        .water_wash(water_wash)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;
 
`timescale 10ns / 1ps

module automatic_washing_machine_tb;

    reg clk;
    reg reset;
    reg door_close;
    reg start;
    reg filled;
    reg detergent_added;
    reg cycle_timeout;
    reg drained;
    reg spin_timeout;

    wire door_lock;
    wire motor_on;
    wire fill_value_on;
    wire drain_value_on;
    wire done;
    wire soap_wash;
    wire water_wash;

    // DUT Instantiation
    automatic_washing_machine DUT (
        .clk(clk),
        .reset(reset),
        .door_close(door_close),
        .start(start),
        .filled(filled),
        .detergent_added(detergent_added),
        .cycle_timeout(cycle_timeout),
        .drained(drained),
        .spin_timeout(spin_timeout),
        .door_lock(door_lock),
        .motor_on(motor_on),
        .fill_value_on(fill_value_on),
        .drain_value_on(drain_value_on),
        .done(done),
        .soap_wash(soap_wash),
        .water_wash(water_wash)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;
 
           initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, automatic_washing_machine_tb);
end


    initial begin
        // Initial values
        clk = 0;
        reset = 0;   // active-low reset
        start = 0;
        door_close = 0;
        filled = 0;
        detergent_added = 0;
        cycle_timeout = 0;
        drained = 0;
        spin_timeout = 0;

        // Apply reset
        #10 reset = 1;

        // Start washing
        #10 start = 1;
            door_close = 1;

        // Fill water
        #20 filled = 1;

        // Add detergent
        #20 detergent_added = 1;

        // Soap wash cycle complete
        #30 cycle_timeout = 1;
        #10 cycle_timeout = 0;

        // Drain soap water
        #20 drained = 1;
        #10 drained = 0;

        // Refill for water wash
        #20 filled = 1;

        // Water wash complete
        #30 cycle_timeout = 1;
        #10 cycle_timeout = 0;

        // Drain water
        #20 drained = 1;
        #10 drained = 0;

        // Spin cycle complete
        #30 spin_timeout = 1;
        #10 spin_timeout = 0;

        #50 $finish;
    end

    initial begin
        $monitor(
            "T=%0t | start=%b door=%b filled=%b det=%b cycle_to=%b drained=%b spin_to=%b | lock=%b motor=%b fill=%b drain=%b soap=%b water=%b done=%b",
            $time, start, door_close, filled, detergent_added,
            cycle_timeout, drained, spin_timeout,
            door_lock, motor_on, fill_value_on,
            drain_value_on, soap_wash, water_wash, done
        );
    end

endmodule


    initial begin
        // Initial values
        clk = 0;
        reset = 0;   // active-low reset
        start = 0;
        door_close = 0;
        filled = 0;
        detergent_added = 0;
        cycle_timeout = 0;
        drained = 0;
        spin_timeout = 0;

        // Apply reset
        #10 reset = 1;

        // Start washing
        #10 start = 1;
            door_close = 1;

        // Fill water
        #20 filled = 1;

        // Add detergent
        #20 detergent_added = 1;

        // Soap wash cycle complete
        #30 cycle_timeout = 1;
        #10 cycle_timeout = 0;

        // Drain soap water
        #20 drained = 1;
        #10 drained = 0;

        // Refill for water wash
        #20 filled = 1;

        // Water wash complete
        #30 cycle_timeout = 1;
        #10 cycle_timeout = 0;

        // Drain water
        #20 drained = 1;
        #10 drained = 0;

        // Spin cycle complete
        #30 spin_timeout = 1;
        #10 spin_timeout = 0;

        #50 $finish;
    end

    initial begin
        $monitor(
            "T=%0t | start=%b door=%b filled=%b det=%b cycle_to=%b drained=%b spin_to=%b | lock=%b motor=%b fill=%b drain=%b soap=%b water=%b done=%b",
            $time, start, door_close, filled, detergent_added,
            cycle_timeout, drained, spin_timeout,
            door_lock, motor_on, fill_value_on,
            drain_value_on, soap_wash, water_wash, done
        );
    end

endmodule
