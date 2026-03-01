import React, { useState } from 'react';
import { FileText, Download, Calendar, TrendingUp, DollarSign, Activity, Leaf, Award, ArrowRight, CheckCircle } from 'lucide-react';
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts';

const monthlyPerformanceData = [
  { month: 'Aug', production: 756, savings: 212 },
  { month: 'Sep', production: 812, savings: 238 },
  { month: 'Oct', production: 768, savings: 224 },
  { month: 'Nov', production: 698, savings: 218 },
  { month: 'Dec', production: 654, savings: 204 },
  { month: 'Jan', production: 876, savings: 268 },
];

export function ReportsScreen() {
  const [reportType, setReportType] = useState<'performance' | 'financial' | 'esg'>('performance');

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-blue-900 to-slate-900 text-white p-6 rounded-b-3xl relative overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <div className="absolute top-0 right-0 w-40 h-40 border border-white rounded-full"></div>
        </div>
        <div className="relative z-10">
          <div className="flex items-center gap-2 mb-2">
            <FileText className="w-5 h-5 text-blue-400" />
            <span className="text-xs text-blue-400 uppercase tracking-wider">Value Reporting</span>
          </div>
          <h1 className="text-2xl mb-1">Performance Reports</h1>
          <p className="text-slate-300 text-sm">Executive summaries & insights</p>
        </div>
      </div>

      <div className="px-4 flex flex-col gap-5">
        {/* Report Type Selector */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <div className="flex gap-2">
            <button
              onClick={() => setReportType('performance')}
              className={`flex-1 py-3 px-4 rounded-lg text-sm transition-all ${
                reportType === 'performance' 
                  ? 'bg-blue-600 text-white shadow-md' 
                  : 'bg-slate-50 text-slate-600 hover:bg-slate-100'
              }`}
            >
              <Activity className="w-4 h-4 mx-auto mb-1" />
              Performance
            </button>
            <button
              onClick={() => setReportType('financial')}
              className={`flex-1 py-3 px-4 rounded-lg text-sm transition-all ${
                reportType === 'financial' 
                  ? 'bg-emerald-600 text-white shadow-md' 
                  : 'bg-slate-50 text-slate-600 hover:bg-slate-100'
              }`}
            >
              <DollarSign className="w-4 h-4 mx-auto mb-1" />
              Financial
            </button>
            <button
              onClick={() => setReportType('esg')}
              className={`flex-1 py-3 px-4 rounded-lg text-sm transition-all ${
                reportType === 'esg' 
                  ? 'bg-green-600 text-white shadow-md' 
                  : 'bg-slate-50 text-slate-600 hover:bg-slate-100'
              }`}
            >
              <Leaf className="w-4 h-4 mx-auto mb-1" />
              ESG
            </button>
          </div>
        </div>

        {/* Performance Report */}
        {reportType === 'performance' && (
          <>
            {/* Monthly Summary Card */}
            <div className="bg-gradient-to-br from-blue-500 to-blue-600 rounded-2xl p-5 text-white shadow-lg">
              <div className="flex items-center justify-between mb-4">
                <div>
                  <div className="text-blue-100 text-sm mb-1">January 2026 Summary</div>
                  <div className="text-3xl">876 kWh</div>
                </div>
                <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center">
                  <TrendingUp className="w-7 h-7" />
                </div>
              </div>
              <div className="grid grid-cols-3 gap-3 pt-4 border-t border-white/20">
                <div>
                  <div className="text-blue-200 text-xs mb-0.5">vs Expected</div>
                  <div className="text-lg">+8.2%</div>
                </div>
                <div>
                  <div className="text-blue-200 text-xs mb-0.5">vs Last Month</div>
                  <div className="text-lg">+14.2%</div>
                </div>
                <div>
                  <div className="text-blue-200 text-xs mb-0.5">Efficiency</div>
                  <div className="text-lg">94.2%</div>
                </div>
              </div>
            </div>

            {/* Key Performance Metrics */}
            <div className="bg-white rounded-2xl border border-slate-200 p-5">
              <h3 className="text-slate-900 mb-4">Key Performance Indicators</h3>
              <div className="space-y-4">
                <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                  <div>
                    <div className="text-sm text-slate-900 mb-1">System Availability</div>
                    <div className="text-xs text-slate-500">Operational uptime</div>
                  </div>
                  <div className="text-right">
                    <div className="text-lg text-emerald-600">99.8%</div>
                    <div className="text-xs text-slate-500">Industry leading</div>
                  </div>
                </div>
                <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                  <div>
                    <div className="text-sm text-slate-900 mb-1">AI Prediction Accuracy</div>
                    <div className="text-xs text-slate-500">Forecast precision</div>
                  </div>
                  <div className="text-right">
                    <div className="text-lg text-blue-600">94.2%</div>
                    <div className="text-xs text-emerald-600">+2.1% improvement</div>
                  </div>
                </div>
                <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                  <div>
                    <div className="text-sm text-slate-900 mb-1">Capacity Factor</div>
                    <div className="text-xs text-slate-500">Actual vs rated output</div>
                  </div>
                  <div className="text-right">
                    <div className="text-lg text-slate-900">18.6%</div>
                    <div className="text-xs text-emerald-600">vs 15.2% avg</div>
                  </div>
                </div>
                <div className="flex items-center justify-between">
                  <div>
                    <div className="text-sm text-slate-900 mb-1">Anomalies Detected</div>
                    <div className="text-xs text-slate-500">Issues prevented</div>
                  </div>
                  <div className="text-right">
                    <div className="text-lg text-blue-600">3</div>
                    <div className="text-xs text-slate-500">R1,240 saved</div>
                  </div>
                </div>
              </div>
            </div>

            {/* Monthly Production Chart */}
            <div className="bg-white rounded-2xl border border-slate-200 p-5">
              <h3 className="text-slate-900 mb-1">6-Month Production Trend</h3>
              <p className="text-sm text-slate-500 mb-4">Solar generation (kWh)</p>
              <ResponsiveContainer width="100%" height={200}>
                <BarChart data={monthlyPerformanceData}>
                  <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" />
                  <XAxis 
                    dataKey="month" 
                    tick={{ fontSize: 12, fill: '#64748B' }}
                    tickLine={false}
                    axisLine={{ stroke: '#E2E8F0' }}
                  />
                  <YAxis 
                    tick={{ fontSize: 12, fill: '#64748B' }}
                    tickLine={false}
                    axisLine={{ stroke: '#E2E8F0' }}
                  />
                  <Tooltip 
                    contentStyle={{ 
                      backgroundColor: '#1E293B', 
                      border: 'none', 
                      borderRadius: '8px',
                      color: '#fff'
                    }}
                  />
                  <Bar dataKey="production" fill="#3B82F6" radius={[4, 4, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </div>

            {/* Download Report Button */}
            <button className="w-full bg-blue-600 text-white py-4 rounded-xl hover:bg-blue-700 transition-colors shadow-md flex items-center justify-center gap-2">
              <Download className="w-5 h-5" />
              <span>Download Performance Report (PDF)</span>
            </button>
          </>
        )}

        {/* Financial Report */}
        {reportType === 'financial' && (
          <>
            {/* Revenue Summary Card */}
            <div className="bg-gradient-to-br from-emerald-500 to-emerald-600 rounded-2xl p-5 text-white shadow-lg">
              <div className="flex items-center justify-between mb-4">
                <div>
                  <div className="text-emerald-100 text-sm mb-1">January 2026 Revenue</div>
                  <div className="text-3xl">R268</div>
                </div>
                <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center">
                  <DollarSign className="w-7 h-7" />
                </div>
              </div>
              <div className="grid grid-cols-3 gap-3 pt-4 border-t border-white/20">
                <div>
                  <div className="text-emerald-200 text-xs mb-0.5">vs Last Month</div>
                  <div className="text-lg">+19.3%</div>
                </div>
                <div>
                  <div className="text-emerald-200 text-xs mb-0.5">AI Bonus</div>
                  <div className="text-lg">+R34</div>
                </div>
                <div>
                  <div className="text-emerald-200 text-xs mb-0.5">Daily Avg</div>
                  <div className="text-lg">R8.64</div>
                </div>
              </div>
            </div>

            {/* ROI Progress */}
            <div className="bg-white rounded-2xl border border-slate-200 p-5">
              <h3 className="text-slate-900 mb-4">ROI Progress</h3>
              <div className="mb-4">
                <div className="flex justify-between items-center mb-2">
                  <span className="text-sm text-slate-600">Investment Recovery</span>
                  <span className="text-slate-900 font-medium">42.4%</span>
                </div>
                <div className="w-full bg-slate-100 rounded-full h-3">
                  <div className="bg-gradient-to-r from-emerald-500 to-emerald-600 h-3 rounded-full" style={{ width: '42.4%' }}></div>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4 text-sm pt-4 border-t border-slate-200">
                <div>
                  <div className="text-slate-600 mb-1">Total Invested</div>
                  <div className="text-slate-900">R18,500</div>
                </div>
                <div>
                  <div className="text-slate-600 mb-1">Recovered</div>
                  <div className="text-emerald-600">R7,842</div>
                </div>
                <div>
                  <div className="text-slate-600 mb-1">Standard Payback</div>
                  <div className="text-slate-900">6.8 years</div>
                </div>
                <div>
                  <div className="text-slate-600 mb-1">With Ohwr</div>
                  <div className="text-emerald-600">5.2 years</div>
                </div>
              </div>
            </div>

            {/* Savings Breakdown */}
            <div className="bg-white rounded-2xl border border-slate-200 p-5">
              <h3 className="text-slate-900 mb-4">Savings Breakdown (YTD)</h3>
              <div className="space-y-3">
                <div className="flex items-center justify-between p-3 bg-emerald-50 rounded-xl">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-emerald-100 rounded-lg flex items-center justify-center">
                      <DollarSign className="w-5 h-5 text-emerald-600" />
                    </div>
                    <div>
                      <div className="text-sm text-slate-900">Energy Savings</div>
                      <div className="text-xs text-slate-600">Grid avoidance</div>
                    </div>
                  </div>
                  <div className="text-emerald-600 font-medium">R6,656</div>
                </div>
                <div className="flex items-center justify-between p-3 bg-blue-50 rounded-xl">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                      <TrendingUp className="w-5 h-5 text-blue-600" />
                    </div>
                    <div>
                      <div className="text-sm text-slate-900">AI Optimization</div>
                      <div className="text-xs text-slate-600">Intelligent boost</div>
                    </div>
                  </div>
                  <div className="text-blue-600 font-medium">+R1,186</div>
                </div>
                <div className="flex items-center justify-between p-3 bg-purple-50 rounded-xl">
                  <div className="flex items-center gap-3">
                    <div className="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center">
                      <Activity className="w-5 h-5 text-purple-600" />
                    </div>
                    <div>
                      <div className="text-sm text-slate-900">Damage Prevention</div>
                      <div className="text-xs text-slate-600">Early detection</div>
                    </div>
                  </div>
                  <div className="text-purple-600 font-medium">R1,240</div>
                </div>
              </div>
              <div className="mt-4 pt-4 border-t border-slate-200 flex items-center justify-between">
                <span className="text-slate-600 font-medium">Total Value</span>
                <span className="text-2xl text-slate-900">R9,082</span>
              </div>
            </div>

            {/* Download Report Button */}
            <button className="w-full bg-emerald-600 text-white py-4 rounded-xl hover:bg-emerald-700 transition-colors shadow-md flex items-center justify-center gap-2">
              <Download className="w-5 h-5" />
              <span>Download Financial Report (PDF)</span>
            </button>
          </>
        )}

        {/* ESG Report */}
        {reportType === 'esg' && (
          <>
            {/* Environmental Impact Card */}
            <div className="bg-gradient-to-br from-green-500 to-green-600 rounded-2xl p-5 text-white shadow-lg">
              <div className="flex items-center justify-between mb-4">
                <div>
                  <div className="text-green-100 text-sm mb-1">CO₂ Avoided (YTD)</div>
                  <div className="text-3xl">6.2 tons</div>
                </div>
                <div className="w-14 h-14 bg-white/20 rounded-2xl flex items-center justify-center">
                  <Leaf className="w-7 h-7" />
                </div>
              </div>
              <p className="text-green-50 text-sm">
                Equivalent to planting 283 trees or removing 1.3 cars from the road for a year
              </p>
            </div>

            {/* ESG Metrics */}
            <div className="bg-white rounded-2xl border border-slate-200 p-5">
              <h3 className="text-slate-900 mb-4">Sustainability Impact</h3>
              <div className="space-y-4">
                <div>
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm text-slate-600">Clean Energy Generated</span>
                    <span className="text-slate-900 font-medium">4,880 kWh</span>
                  </div>
                  <div className="text-xs text-slate-500">100% renewable, zero emissions</div>
                </div>
                <div className="pt-4 border-t border-slate-100">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm text-slate-600">Grid Dependency Reduction</span>
                    <span className="text-emerald-600 font-medium">78.4%</span>
                  </div>
                  <div className="text-xs text-slate-500">Maximizing self-sufficiency</div>
                </div>
                <div className="pt-4 border-t border-slate-100">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm text-slate-600">System Lifespan Extension</span>
                    <span className="text-purple-600 font-medium">+2.4 years</span>
                  </div>
                  <div className="text-xs text-slate-500">vs industry average (AI optimization)</div>
                </div>
                <div className="pt-4 border-t border-slate-100">
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm text-slate-600">E-Waste Reduction</span>
                    <span className="text-blue-600 font-medium">68 kg</span>
                  </div>
                  <div className="text-xs text-slate-500">Battery & component preservation</div>
                </div>
              </div>
            </div>

            {/* ESG Highlights */}
            <div className="bg-gradient-to-br from-green-50 to-white rounded-2xl border border-green-200 p-5">
              <div className="flex items-center gap-2 mb-4">
                <Award className="w-5 h-5 text-green-600" />
                <h3 className="text-slate-900">ESG Highlights</h3>
              </div>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <div className="text-sm text-slate-900 mb-1">Carbon Neutral Operations</div>
                    <p className="text-xs text-slate-600">All energy from renewable sources</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <div className="text-sm text-slate-900 mb-1">Responsible Resource Use</div>
                    <p className="text-xs text-slate-600">AI extends equipment lifespan</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle className="w-5 h-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <div className="text-sm text-slate-900 mb-1">Energy Independence</div>
                    <p className="text-xs text-slate-600">Reducing fossil fuel dependency</p>
                  </div>
                </div>
              </div>
            </div>

            {/* Download Report Button */}
            <button className="w-full bg-green-600 text-white py-4 rounded-xl hover:bg-green-700 transition-colors shadow-md flex items-center justify-center gap-2">
              <Download className="w-5 h-5" />
              <span>Download ESG Report (PDF)</span>
            </button>
          </>
        )}

        {/* Report Footer Info */}
        <div className="bg-gradient-to-br from-slate-50 to-blue-50 rounded-2xl border border-blue-100 p-5">
          <div className="flex items-center gap-2 mb-3">
            <Calendar className="w-5 h-5 text-blue-600" />
            <h3 className="text-slate-900">Automated Reporting</h3>
          </div>
          <p className="text-sm text-slate-700 leading-relaxed mb-3">
            Reports are generated monthly and designed to be investor-ready, audit-compliant, and executive-friendly.
          </p>
          <div className="flex items-center justify-between text-sm pt-3 border-t border-blue-200">
            <span className="text-slate-600">Next report:</span>
            <span className="text-slate-900 font-medium">Feb 1, 2026</span>
          </div>
        </div>
      </div>
    </div>
  );
}
