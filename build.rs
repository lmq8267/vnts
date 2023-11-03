fn main() {
    std::fs::create_dir_all("src/proto").unwrap();
    protobuf_codegen::Codegen::new()
        .pure()
        .out_dir("src/proto")
        .inputs(&["proto/message.proto"])
        .include("proto")
        .run()
        .expect("Codegen failed.");
}
