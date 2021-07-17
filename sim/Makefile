# Makefile For VCS

export XILINX_VIVADO=/home/software/xilinx/Vivado/2015.2

all:
	@echo "VCS Verification ENV"

cmp:
	@vcs -LDFLAGS -Wl,--no-as-needed -lca -sverilog -debug_pp +lint=TFIPC-L +lint=PCWM +libext+.v \
		-y /home/software/xilinx/Vivado/2015.2/data/verilog/src/unisims \
		-y /home/software/xilinx/Vivado/2015.2/data/verilog/src/unimacro \
		-f /home/software/xilinx/Vivado/2015.2/data/secureip/secureip_cell.list.f \
		/home/software/xilinx/Vivado/2015.2/data/verilog/src/glbl.v \
		../rtl/TMDSEncoder.v ../rtl/TMDSOutputSerdes.v ../rtl/TMDSCtrlTop.v ../rtl/VGACtrlTop.v ../rtl/AxiMemRdCtrl.v ../rtl/async_fifo.v \
		axi_slave_fifo_sync.v mem_axi.v tb_AxiMemVideo.sv -top tb_AxiMemVideo

run:
	@./simv

dve:
	@dve -vpd wave.vpd &

clean:
	@rm -rf ucli.key csrc simv simv.daidir *.vpd DVEfiles

