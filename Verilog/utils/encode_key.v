module key_event_encoder (
    input  wire [2:0] octave,
    input  wire [3:0] key,
    input  wire       pressed,
    output wire [7:0] event_code
);

    assign event_code = {pressed, octave, key};

endmodule